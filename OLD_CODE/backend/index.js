import express from 'express';
import Userroute from './Routes/api/User.js';
import Volroute from './Routes/api/Volunteers.js';
import Alertroute from './Routes/api/Alert.js';

import db from './config/db.js';
const app = express();
app.use(express.json());
db();
app.use('/api/user', Userroute);
app.use('/api/vol', Volroute);
app.use('/api/alert', Alertroute);
app.use((error, req, res, next) => {
	if (res.headerSent) {
		return next(error);
	}
	res.status(error.code).json({ message: error.message });
});

app.listen(process.env.PORT || 8000, () => {
	console.log('server running on port 8000');
});
