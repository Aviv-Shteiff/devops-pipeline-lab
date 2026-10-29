const express = require('express');

const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('DevOps pipeline lab is running');
});

app.get('/health', (req, res) => { res.status(500).json({ status: 'error' }); });

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server listening on port ${PORT}`);
});