import { useEffect, useState } from "react";

// import Create from "./create";
import Navbar from "../components/Navbar";
import { Responder } from '../types/Responder';
//import Update from "./update";
import { supabase } from "../../utils/supabaseClient";
import { timer_duration } from "@/constants";

// import { useRouter } from 'next/router';


const Responders = () => {
  const [responders, setResponders] = useState<any>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [update, setUpdate] = useState(false);
 
  useEffect(() => {
    const fetchResponders = async () => {
      try {
        const { data: responders, error } = await supabase
          .from("profiles")
          .select("*");

        if (error) throw error;

        setResponders(responders);
        setLoading(false);
      } catch (error: any) {
        setLoading(false);
        setError(error.message);
      }
    };
    fetchResponders();
    const timer = setInterval( ()=>{
      console.log(`this runs every ${timer_duration} sec`)
      fetchResponders();
    },timer_duration)

    

    return ()=>{
      clearInterval(timer)
    }
    
    

   
  }, []);

  async function deleteCamera(id: string) {
    const { error } = await supabase.from('profiles').delete().match({ id });
    if (error) console.log('error', error);
    else {
      const updatedResponders = responders.filter((responder: any) => responder.id !== id);
      setResponders(updatedResponders);
    }
  }

  if (loading) {
    return <p>Loading...</p>;
  }

  if (error) {
    return (
      <>
        <Navbar />
        <h1 className="text-center text-red-500">{error}</h1>
      </>
    );
  }
  // const router = useRouter();

function handleUpdate() {
    // router.push({
    //     pathname: '/update',
    //     query: { id },
    //   });
    setUpdate(true);
}


  return (
    <div className="h-screen w-screeen flex justify-center">
        <div className="basis-1/5">
            <Navbar/>
        </div>
        <div className="basis-4/5 p-10">
            <div className="topbar h-15 m-5">
                <p className="text-white">TO ADD A NEW RESPONDER: please create a new account with the corresponding details</p> 
                {/* <p className="text-white">Update a responder cannot</p> */}
            </div>
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {responders.map((responder: any) => (
            <div
                key={responder.id}
                className="bg-white rounded-lg shadow-md p-4 cursor-pointer"
            >
                {responder.username && <p className="text-lg text-black font-semibold my-2">Username: {responder.username}</p>
                }
                <h3 className="text-black">Id: {responder.id}</h3>
                {!responder.username && <h3 className="text-black">No Username</h3>}

                {responder.full_name && <p className="text-black">Full Name: {responder.full_name}</p>}
              
                <div className="flex m-2 w-4/5 justify-around">
                <button onClick={() => deleteCamera(responder.id)}>Delete</button>
                {/* <button onClick={() => {handleUpdate} */}
                {/* }>Update</button> */}

                {/* {update && <Update id={responder.id}/>} */}
                </div>
                
            </div>
            ))}
            </div>
            </div>
    </div>
  );
};

export default Responders;
// */