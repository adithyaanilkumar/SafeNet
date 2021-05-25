import mongoose from 'mongoose';
const schema = mongoose.Schema;
const vol = new schema({
	username: {
		type: String,
		required: true,
	},
	lat: {
		type: Number,
		required: true,
	},
	long: {
		type: Number,
		required: true,
	},
});
const exp = mongoose.model('Volunteer', vol);
export default exp;
