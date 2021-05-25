import mongo from 'mongoose';
const connectdb = async () => {
	try {
		const conn = await mongo.connect(
			'mongodb+srv://pseudochaos:HelloWorld@cluster0.wpqfu.mongodb.net/myFirstDatabase?retryWrites=true&w=majority',
			{
				useUnifiedTopology: true,
				useNewUrlParser: true,
				useCreateIndex: true,
			}
		);
		console.log(`Mongodb connected: ${conn.connection.host}`);
	} catch (err) {
		console.log(`Error: ${err.message}`);
		process.exit(1);
	}
};

export default connectdb;
