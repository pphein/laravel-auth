<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Cart;
use App\Models\User;
use ShoppingCart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class CartController extends Controller
{
    public function index()
    {
        $cartItems = [];// ShoppingCart::getContent(); // Retrieve all items in the cart

        $user = Auth::user();
        $cartItems = $user->cart()->get();
        Log::info("Cart >> ". print_r($cartItems, true));
        return view('carts.index', compact('cartItems'));
    }

    public function addToCart(int $bookId)
    {
        $user = Auth::user();

        // Check if the book is already in the cart
        $cartItem = $user->cart()->where('book_id', $bookId)->first();

        if ($cartItem) {
            // Increment quantity if already in cart
            $cartItem->increment('quantity');
        } else {
            // Add new item to cart
            $user->cart()->create([
                'book_id' => $bookId,
                'quantity' => 1,
            ]);
        }

        return back()->with('success', 'Book added to cart!');
    }

    public function viewCart()
    {
        $cartItems = Auth::user()->cart()->with('book')->get();
        return view('cart.index', compact('cartItems'));
    }

    public function removeFromCart(ShoppingCart $cart)
    {
        $cart->delete();
        return back()->with('success', 'Book removed from cart!');
    }



}
