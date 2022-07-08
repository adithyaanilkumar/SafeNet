import express from 'express';
import error from '../../models/Error.js';
import User from '../../models/Users.js';
import Vol from '../../models/Volunteer.js';
const router = express.Router();
const distance = (lat1, lon1, lat2, lon2) => {
	var p = 0.017453292519943295; // Math.PI / 180
	var c = Math.cos;
	var a =
		0.5 -
		c((lat2 - lat1) * p) / 2 +
		(c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p))) / 2;

	return 12742 * Math.asin(Math.sqrt(a)); // 2 * R; R = 6371 km
};
router.post('/', async (req, res) => {
	const { username } = req.body;
	try {
		const user = await User.findOne({ username }).select('lat long');
		const volunteers = await Vol.find();
		console.log(volunteers);
		const nearby = [];
		volunteers.map((i) => {
			if (distance(i.lat, i.long, user.lat, user.long) < 3) {
				console.log('yeet');
				nearby.push(i.username);
			} else {
				console.log('not yeet');
			}
		});
		// Socket code to send alert to all usernames present on nearby
		return res.json({ msg: 'ok' });
	} catch (err) {
		console.log(err);
		return res.status(500).json({ msg: 'Server Error' });
	}
});

export default router;
