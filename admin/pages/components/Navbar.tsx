import { Drawer, Toolbar, IconButton, List, Divider, styled } from "@mui/material"
import ChevronLeftIcon from '@mui/icons-material/ChevronLeft';
import { mainListItems, secondaryListItems } from './ListItems';
import * as React from 'react'; 
import { useUser } from "@supabase/auth-helpers-react";
import { useEffect, useState } from "react";

export default function Navbar(){
  /*
  const drawerWidth: number = 240;
  const Drawer = styled(MuiDrawer, { shouldForwardProp: (prop) => prop !== 'open' })(
    ({ theme, open }) => ({
      '& .MuiDrawer-paper': {
        position: 'relative',
        whiteSpace: 'nowrap',
        width: drawerWidth,
        transition: theme.transitions.create('width', {
          easing: theme.transitions.easing.sharp,
          duration: theme.transitions.duration.enteringScreen,
        }),
        boxSizing: 'border-box',
        ...(!open && {
          overflowX: 'hidden',
          transition: theme.transitions.create('width', {
            easing: theme.transitions.easing.sharp,
            duration: theme.transitions.duration.leavingScreen,
          }),
          width: theme.spacing(7),
          [theme.breakpoints.up('sm')]: {
            width: theme.spacing(9),
          },
        }),
      },
    }),
  );
  */
    const [open, setOpen] = React.useState(true);
    const toggleDrawer = () => {
        setOpen(!open);
    };
    const user= useUser();
    const [isSignedIn, setIsSignedIn] = useState(false)


    // useEffect(()=>{
      /*
      if(user == null) {
        alert('Please sign in to view this page')
          return {
            redirect: {
              destination: '/',
              permanent: false,
            },
        }
      }
      else setIsSignedIn(true);
      */
    // },[user])

    return(
      
        <div className="">
            <Drawer variant="permanent" open={open} >
          <Toolbar
            sx={{
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'flex-end',
              px: [1],
            }}
          >
            <IconButton onClick={toggleDrawer}>
              <ChevronLeftIcon />
            </IconButton>
          </Toolbar>
          <Divider />
          <List component="nav" sx={{width:'18vw', padding:'1rem'}}>
            {mainListItems}
            <Divider sx={{ my: 1}} />
            {secondaryListItems}
          </List>
        </Drawer>
        </div>
        
    )
}
