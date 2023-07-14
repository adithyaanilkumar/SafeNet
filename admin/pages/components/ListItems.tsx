import * as React from 'react';
import ListItemButton from '@mui/material/ListItemButton';
import ListItemIcon from '@mui/material/ListItemIcon';
import ListItemText from '@mui/material/ListItemText';
import ListSubheader from '@mui/material/ListSubheader';
import DashboardIcon from '@mui/icons-material/Dashboard';
import PeopleIcon from '@mui/icons-material/People';
import BarChartIcon from '@mui/icons-material/BarChart';
import BrowseGalleryIcon from '@mui/icons-material/BrowseGallery';
import AccountCircleIcon from '@mui/icons-material/AccountCircle';
import CameraAltIcon from '@mui/icons-material/CameraAlt';
import AssignmentIcon from '@mui/icons-material/Assignment';
import Link from '@mui/material/Link';

export const mainListItems = (
    <React.Fragment>
      <ListItemButton href='./dashboard'>
        <ListItemIcon>
          <DashboardIcon />
        </ListItemIcon>
        <ListItemText className='text-#334155' primary="Dashboard" />
      </ListItemButton>

      <Link href='./alerts' underline='none' color='#334155'>
      <ListItemButton>
        <ListItemIcon>
          <BrowseGalleryIcon/>
        </ListItemIcon>
        <ListItemText className='text-#334155' primary="Alerts" />
      </ListItemButton>
    </Link>

    {/* <Link href='./assignments' underline='none' color='#334155'>
      <ListItemButton>
        <ListItemIcon>
          <AssignmentIcon/>
        </ListItemIcon>
        <ListItemText className='text-#334155' primary="Assignments" />
      </ListItemButton>
    </Link> */}

    <Link href='./cameras' underline='none' color='#334155'>
      <ListItemButton>
        <ListItemIcon>
          <CameraAltIcon/>
        </ListItemIcon>
        <ListItemText className='text-#334155' primary="Cameras" />
      </ListItemButton>
    </Link>

    <Link href='./responders' underline='none' color='#334155'>
      <ListItemButton>
        <ListItemIcon>
          <PeopleIcon/>
        </ListItemIcon>
        <ListItemText className='text-#334155' primary="Responders" />
      </ListItemButton>
    </Link>

      <Link href='./reports' underline='none' color='#334155'>
      <ListItemButton>
        <ListItemIcon>
          <BarChartIcon />
        </ListItemIcon>
        <ListItemText className='text-#334155' primary="Reports" />
      </ListItemButton>
    </Link>

    <Link href='./' underline='none' color='#334155'>
      <ListItemButton>
      <ListItemIcon>
          <AccountCircleIcon/>
        </ListItemIcon>
        <ListItemText className='text' primary="Account" />
      </ListItemButton>
    </Link>
  </React.Fragment>
);

/*
export const secondaryListItems = (
  <React.Fragment>
    <ListSubheader component="div" inset>
      Saved reports
    </ListSubheader>
    <ListItemButton>
      <ListItemIcon>
        <AssignmentIcon />
      </ListItemIcon>
      <ListItemText className='text-#334155' primary="Current month" />
    </ListItemButton>
    <ListItemButton>
      <ListItemIcon>
        <AssignmentIcon />
      </ListItemIcon>
      <ListItemText className='text-#334155' primary="Last quarter" />
    </ListItemButton>
    <ListItemButton>
      <ListItemIcon>
        <AssignmentIcon />
      </ListItemIcon>
      <ListItemText className='text-#334155' primary="Year-end sale" />
    </ListItemButton>
  </React.Fragment>
  // </Router>
);
*/