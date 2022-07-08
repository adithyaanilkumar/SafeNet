import express from 'express';
import error from '../../models/Error.js';
import Vol from '../../models/Volunteer.js';
const router = express.Router();
router.post('/', async (req, res) => {
	const { username, lat, long } = req.body;
	if (!(username, lat, long))
		return res.status(400).json({ msg: 'bad request' });
	const vols = new Vol({ username, lat, long });
	try {
		await vols.save();
		return res.status(200).json({ msg: 'ok' });
	} catch (err) {
		console.log(err);
		return res.status(500).json({ msg: 'Server Error' });
	}
});

router.get('/', async (req, res) => {
	try {
		const volunteers = await Vol.find();
		return res.status(200).json({ volunteers });
	} catch (err) {
		console.log(err);
		return res.status(500).json({ msg: 'Server Error' });
	}
});

export default router;
