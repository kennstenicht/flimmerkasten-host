module.exports = function (environment) {
  return {
    delivery: ['meta'],
    enabled: environment !== 'test',
    failTests: true,
    policy: {
      'default-src': ["'none'"],
      'script-src': ["'self'", "'unsafe-inline'", 'eval'],
      'font-src': ["'self'", 'https://fonts.gstatic.com'],
      'frame-src': ["'self'"],
      'connect-src': ["'self'"],
      'img-src': ['data:', "'self'"],
      'style-src': [
        "'self'",
        "'unsafe-inline'",
        'https://fonts.googleapis.com',
      ],
      'media-src': ["'self'"],
    },
    reportOnly: true,
  };
};
