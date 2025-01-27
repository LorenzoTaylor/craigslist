import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'
import CreateListing from './components/createListing'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <CreateListing/>
    </>
  )
}

export default App
