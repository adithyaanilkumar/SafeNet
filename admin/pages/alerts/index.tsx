import { useEffect, useState } from "react";

import AlertCard from "../components/AlertCard";
import { Assignment } from "../types/Assignment";
import Create from "./create";
import Navbar from "../components/Navbar";
// import Update from "./update";
import { supabase } from "../../utils/supabaseClient";
import { timer_duration } from "@/constants";
import { useRouter } from 'next/router';

export default function Alerts() {
  //const [alerts, setAlerts] = useState<Alert[]>([]);
  const [alerts, setAlerts] = useState<any>([]);
  const [assignments, setAssignments] = useState<Assignment[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [create, setCreate] = useState(false);
  const [responders, setResponders] = useState<any>([]);
  const router = useRouter()
 

  useEffect(() => {
    console.log("alerts in useEffect: ", alerts);
    // mapAlerts() //commented due to errors

    const fetchAlerts = async () => {
      try {
        const { data, error } = await supabase.from("alerts").select("*");
        if (error) throw error;
        setAlerts(data);
        setLoading(false);
      } catch (error: any) {
        setLoading(false);
        setError(error.message);
      }
    };

    const fetchResponders = async () => {
      try {
        const { data, error } = await supabase.from("profiles").select("*");
        if (error) throw error;
        setResponders(data);
      } catch (error: any) {
        console.log(error);
      }
    };  
    fetchAlerts();
    fetchResponders();
    
    const timer = setInterval(() => {
      console.log(`this runs every ${timer_duration} sec`);
      fetchAlerts();
      fetchResponders();
    }, timer_duration);

    return () => {
      clearInterval(timer);
    };
    // }, []);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []); 

  if (loading) {
    return <p>Loading...</p>;
  }

  if (error) {
    return (
      <>
        <Navbar />
        <h1 className='text-center text-red-500'>{error}</h1>
      </>
    );
  }


  /*
  async function deleteAlert(id: string) {
    const { error } = await supabase.from("alerts").delete().match({ id });
    if (error) console.log("error", error);
    else {
      const updatedalerts = alerts.filter(
        (alert: { id: string }) => alert.id !== id
      );
      setAlerts(updatedalerts);
    }
  }
  */

  async function resolveAlert(id: string) {
    const { error } = await supabase.from("alerts").update({ resolved: true }).eq('id', id);;
    if (error) console.log("error", error);
    }
  
  function handleCreate(){
    router.push('/alerts/create');
  }

  return (
    <div className='h-screen w-screeen flex justify-center'>
      <div className='basis-1/5'>
        <Navbar />
      </div>
      <div className='basis-4/5 p-10'>
        {!create && (
          <button
            className='topbar h-15 m-5'
            onClick={() => {
              console.log("to create");
              handleCreate()
            }}
          >
            Add Alert
          </button>
        )}
          <div>
            <div className='grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4'>
              {/* {alerts.map((alert:any,index:number) => ( */}
              {alerts.filter((alert: { resolved: any; }) => alert.resolved == false)
              .map((alert:any,index:number) => (
                <AlertCard key={index} responders={responders} alert={alert} resolveAlert={resolveAlert} />
              ))}
            </div>
          </div>
      </div>
    </div>
  );
}

// */
