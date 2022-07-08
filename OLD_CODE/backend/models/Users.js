import mongoose from 'mongoose';
const schema = mongoose.Schema;
const UserSchema = new schema({
	username: {
		type: String,
		required: true,
		unique: true,
	},
	name: {
		type: String,
		required: true,
	},
	email: {
		type: String,
		required: true,
		unique: true,
	},
	phone: {
		type: Number,
		required: true,
	},
	address: {
		type: String,
		required: true,
	},
	aadharno: {
		type: Number,
		required: true,
	},
	aadharcardphotofront: {
		type: String,
		required: true,
	},
	aadharcardphotoback: {
		type: String,
		required: true,
	},
	emergencycontacts: [
		{
			username: { type: String, required: true },
		},
	],
	lat: {
		type: Number,
		required: true,
	},
	long: {
		type: Number,
		required: true,
	},
});
const exp = mongoose.model('User', UserSchema);
export default exp;
