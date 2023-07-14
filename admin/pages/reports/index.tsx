import Charts from './charts';
import Navbar from '../components/Navbar';
import { supabase } from "../../utils/supabaseClient";
import { useEffect, useState } from "react";
import { timer_duration } from "@/constants";


export default function Home() {
  const [anomalies, setAnomalies] = useState<any>([]);
  const [alerts, setAlerts] = useState<any>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {

    const fetchAnomalies = async () => {
      try {
        const { data, error } = await supabase.from("anomalies").select("*");
        if (error) throw error;
        setAnomalies(data);
        setLoading(false);
      } catch (error: any) {
        setLoading(false);
        setError(error.message);
      }
    };

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

    fetchAnomalies()
    fetchAlerts()

    /*
    const timer = setInterval(() => {
      console.log(`this runs every ${timer_duration} sec`);
      fetchAlerts();
    }, timer_duration);

    return () => {
      clearInterval(timer);
    };
    */
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

  return (
    <div className="h-screen w-screeen flex justify-center items-center ">
    <div className="basis-1/5">
        <Navbar/>
    </div>
    <div className="basis-4/5 w-1/5 m-10 p-10 rounded-xl bg- white">
      <Charts anomalies = {anomalies} alerts = {alerts} />
    </div>
</div>
  );
}
