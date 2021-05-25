const Errorgen = (msg, code) => {
	const er = new Error(msg || 'Server Error');
	er.code = code || 500;
	return er;
};
export default Errorgen;
