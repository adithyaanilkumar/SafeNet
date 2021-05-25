const express = require('express');
const  router = require('express-promise-router')();
//const router =  express.Router();
const UserController = require('../controllers/userController');
const { validateBody, schemas } = require('../helpers/validate')

router.route('/signup').post( validateBody(schemas.authSchema),UserController.signup);

router.route('/signin').post(UserController.signin);

router.route('/secret').post(UserController.secret);

module.exports = router;