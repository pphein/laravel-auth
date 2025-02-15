import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
    plugins: [
        laravel({
            input: [
                'resources/css/app.css',
                'resources/js/app.js',
                'resources/sass/app.scss',
                'resources/css/custom.css',
                'resources/css/login.css',
                'resources/css/grid.css'
            ],
            refresh: true,
        }),
    ],
    // build: {
    //     outDir: 'public/build', // Ensure the manifest.json is in public/build
    //     manifest: true,
    //     rollupOptions: {
    //         output: {
    //             chunkFileNames: 'assets/[name]-[hash].js',
    //             entryFileNames: 'assets/[name]-[hash].js',
    //             assetFileNames: 'assets/[name]-[hash].[ext]',
    //         },
    //     },
    // },
    // server: {
    //     https: true,
    //     hmr: {
    //         host: 'laravel-auth-tfta.onrender.com',
    //         protocol: 'wss', // WebSocket over HTTPS
    //     },
    // }
});
