// routes/favorite_routes.js
const express = require('express');
const FavoriteController = require('../controllers/favorite_controller');
const FavoriteRoutes = express.Router();

FavoriteRoutes.post("/", FavoriteController.addFavorite);
FavoriteRoutes.get("/:userId", FavoriteController.getFavorites);

module.exports = FavoriteRoutes;