import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.tsx'
import { ToastProvider } from './components/Toast.tsx'
import { applyTheme, loadTheme } from './theme.ts'
import { initCodes } from './codes.ts'
import { session } from './session.ts'

// Apply the saved theme before the first render so the page never flashes
// the default theme.
applyTheme(loadTheme())

// Reference-data codes are only used by post-login screens, so load them at boot
// ONLY when a session already exists (e.g. a refresh while logged in). A fresh
// visitor sits on the login screen with no codes call; the Login screen starts
// the load right after a successful login.
//
// Fire-and-forget: the first paint no longer waits on /api/codes. App subscribes
// via useCodes() and re-renders when the sets arrive.
if (session.loggedIn) void initCodes()

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <ToastProvider>
      <App />
    </ToastProvider>
  </StrictMode>,
)
