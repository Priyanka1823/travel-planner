// controllers/favorite_controller.js
const Favorite = require('../models/favorite_model');

exports.addFavorite = async (req, res) => {
    try {
        const favorite = new Favorite({
            user: req.body.user,
            product: req.body.product
        });
        const savedFavorite = await favorite.save();
        res.json({message: 'Successfully added to favorites', favorite: savedFavorite});
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
};

exports.getFavorites = async (req, res) => {
    try {
        const favorites = await Favorite.find({ user: req.params.userId }).populate('product');
        res.json(favorites);
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
};