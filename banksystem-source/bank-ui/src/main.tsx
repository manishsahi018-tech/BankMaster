import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.tsx'
import { applyTheme, loadTheme } from './theme.ts'
import { initCodes } from './codes.ts'

// Apply the saved theme before the first render so the page never flashes
// the default theme.
applyTheme(loadTheme())

// Load the reference-data codes before the first render; screens read them
// synchronously. The operator session is populated by the Login screen.
Promise.allSettled([initCodes()]).then(() => {
  createRoot(document.getElementById('root')!).render(
    <StrictMode>
      <App />
    </StrictMode>,
  )
})
