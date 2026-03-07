/**
 * Anne Huntington Laboratory - Corporate Website Server
 * Simple Express server for serving static HTML/CSS/JS files
 */

const express = require('express');
const path = require('path');
const compression = require('compression');

const app = express();
const PORT = process.env.PORT || 3021;
const HOST = process.env.HOST || '0.0.0.0';

// Enable gzip compression
app.use(compression());

// Serve static files from current directory
app.use(express.static(__dirname, {
  maxAge: '1h', // Cache static assets for 1 hour
  etag: true,
  lastModified: true
}));

// Health check endpoint
app.get('/health', (req, res) => {
  res.status(200).json({
    status: 'healthy',
    service: 'annehuntingtonlaboratory',
    timestamp: new Date().toISOString()
  });
});

// Fallback to index.html for any unmatched routes (SPA behavior)
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

// Error handling middleware
app.use((err, req, res, next) => {
  console.error('Server error:', err);
  res.status(500).json({
    status: 'error',
    message: 'Internal server error'
  });
});

// Start server
app.listen(PORT, HOST, () => {
  console.log(`
╔═══════════════════════════════════════════════════════════╗
║  Anne Huntington Laboratory - Corporate Website          ║
║  Server running at http://${HOST}:${PORT}              ║
║  Environment: ${process.env.NODE_ENV || 'development'}                          ║
╚═══════════════════════════════════════════════════════════╝
  `);
});

// Graceful shutdown
process.on('SIGTERM', () => {
  console.log('SIGTERM received, shutting down gracefully...');
  process.exit(0);
});

process.on('SIGINT', () => {
  console.log('SIGINT received, shutting down gracefully...');
  process.exit(0);
});
