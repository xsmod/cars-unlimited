import { createServer } from 'http';
import handler from 'serve-handler';

const port = process.env.PORT || 3000;

const server = createServer((request, response) => {
    return handler(request, response, {
        public: 'out',
        cleanUrls: false,
        directoryListing: false,
        rewrites: [
            { source: '/:path*', destination: '/index.html' }
        ]
    });
});

server.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
