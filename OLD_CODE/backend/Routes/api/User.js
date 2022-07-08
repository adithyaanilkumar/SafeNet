import express from 'express';
import error from '../../models/Error.js';
import User from '../../models/Users.js';
const router = express.Router();
router.post('/', async (req, res) => {
	const {
		username,
		name,
		email,
		phone,
		address,
		aadharno,
		aadharcardphotofront,
		aadharcardphotoback,
		emergencycontacts,
		lat,
		long,
	} = req.body;
	if (
		!(
			username &&
			name &&
			email &&
			phone &&
			address &&
			aadharno &&
			aadharcardphotofront &&
			aadharcardphotoback &&
			emergencycontacts &&
			lat &&
			long
		)
	) {
		throw error('Bad request', 400);
	}
	const user = new User({
		username,
		name,
		email,
		phone,
		address,
		aadharno,
		aadharcardphotofront,
		aadharcardphotoback,
		emergencycontacts,
		lat,
		long,
	});
	try {
		await user.save();
		return res.status(200).json({ msg: 'ok' });
	} catch (err) {
		console.log(err);
		return res.status(500).json({ msg: 'server' });
	}
});

router.get('/', async (req, res) => {
	const { username } = req.body;
	console.log(username);
	if (!username) {
		return res.status(400).json({ msg: 'Bad Request' });
	}
	try {
		const user = await User.findOne({ username });
		console.log(user);
		if (!user) {
			return res.status(400).json({ msg: 'User not found' });
		}
		return res.status(200).json(user);
	} catch (err) {
		console.log(err);
	}
});

export default router;
