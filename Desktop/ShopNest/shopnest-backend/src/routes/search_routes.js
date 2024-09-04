const express = require('express');
const SearchController = require('../controllers/search_controller');
const SearchRoutes = express.Router();

SearchRoutes.get("/:query", SearchController.searchProducts);

module.exports = SearchRoutes;