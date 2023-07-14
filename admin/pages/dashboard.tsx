import Map from "./components/Map";
import MapWithNoSSR from "./components/Map";
import Navbar from "./components/Navbar"
import dynamic from "next/dynamic";
import { padding } from "@mui/system";

export default function Reports(){
    const MapWithNoSSR = dynamic(() => import("./components/Map"), {
        ssr: false
      });
    
    return(
        <div className="flex h-screen w-screen">
            <div className="w-1/5">
            <Navbar/>
        </div>
        <div className="w-4/5">
            {/* <Map/> */}
            <div className='h-screen flex items-center justify-items-center'> 
                <MapWithNoSSR />
            </div>
        </div>
        </div>
    )
}