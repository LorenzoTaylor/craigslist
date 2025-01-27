import React, { useState } from 'react'
import { Box, Button } from '@mui/material'

const CreateListing = () => {
  const [title, setTitle] = useState(String);
  const [Description, setDescription] = useState(String); 
  const [id, setId] = useState( Number);

  const fetchListings = async () => {
    const response = await fetch('http://localhost:4567/listings');
    const data = await response.json;
  }

  const DeleteListings = async () => {
    
  }

  const MakeListing = async () => {
    
  }

  const UpdateListing = async () => {
    
  }


  return (
    <div style={{width: "100vw", height: "100vh", display: "flex", justifyContent: "center", alignItems: "center"}}>
        <Box sx={{display: "flex", justifyContent: "center", alignItems: "center", flexDirection: "column", gap: "20px"}}>
            <Box sx={{display: "flex", gap: "20px"}}>
              <Button sx={{borderRadius: "15px"}} variant="outlined">Delete Listing</Button>
              <Button sx={{borderRadius: "15px"}} variant="outlined">View Listings</Button>
            </Box>
            <form style={{ display: "flex", flexDirection: "column", gap: "5px"}}>
                <label>
                  Title
                </label>
                <input 
                type="text"
                name='title'
                value={title}
                onChange={e => setTitle(e.target.value)}>
                </input>
                <label>
                  Description
                </label>
                <input 
                name='description'
                type="text"
                value={Description}
                onChange={e => setDescription(e.target.value)}>
                </input>
                <label>
                  ID
                </label>
                <input 
                name='id'
                type="integer"
                value={id}
                onChange={e => setId(parseInt(e.target.value))}>
                </input>
                <Box sx={{ display: 'flex', gap: "10px"}}>
                  <Button sx={{marginTop: "15px"}}variant="contained">Create Listing</Button>
                  <Button sx={{marginTop: "15px"}}variant="contained">Update Listing</Button>
                </Box>
            </form>
        </Box>
    </div>
  )
}

export default CreateListing