import { useEffect, useState } from 'react';

import { Alert } from '../types/Alert';
import { supabase } from "../../utils/supabaseClient";
import { useRouter } from 'next/router';

export default function Create() {
  const [alertId, setAlertId] = useState<string>('');
  const [anomalyId, setAnomalyId] = useState<string>('');
  //const [latitude, setLatitude] = useState<string>('');
  //const [longitude, setLongitude] = useState<string>('');
  const [cameraId, setCameraId] = useState<string>('');
  const [responderId, setResponderId] = useState<string|null>('');
  const router = useRouter();
  
  const handleGoBack = () => {
    router.back();
  }

  // async function sentRequest(id: string){
  //   const { data, error } = await supabase
  //   //
  //   .from('alerts')
  //   .select("*")
  //   .eq('id', id);
  //     if (error){
  //       // throw error;
  //       return false
  //     } 
  //     return true
  // }
  async function sentRequest(id: string) {
    try {
      const { data, error } = await supabase
        .from('alerts')
        .select('*')
        .eq('id', id);
      
      if (error) {
        console.error('Error fetching alerts:', error);
        return false;
      }
      
      return data.length > 0; // Check if any alerts were found for the given anomalyId
    } catch (error) {
      console.error('Error fetching alerts:', error);
      return false;
    }
  }

  // async function fetchCameraCoordinates(cameraId: string) {
  //   try {
  //     const { data, error } = await supabase
  //       .from('cameras')
  //       .select('latitude, longitude')
  //       .eq('id', cameraId); // Filter by the provided cameraId
      
  //     if (error) {
  //       console.error('Error fetching camera coordinates:', error);
  //       return { latitude: null, longitude: null }; // Return default values if an error occurs
  //     }
      
  //     if (data.length > 0) {
  //       const { latitude, longitude } = data[0];
  //       return { latitude, longitude };
  //     }
      
  //     return { latitude: null, longitude: null }; // Return default values if no data is found
  //   } catch (error) {
  //     console.error('Error fetching camera coordinates:', error);
  //     return { latitude: null, longitude: null }; // Return default values if an error occurs
  //   }
  // }
  
  
  
  

  // async function addAlert() {
  //   if(await sentRequest(anomalyId)) alert('alert exists for this anomaly')
  //   if(!responderId) setResponderId(null)
  //   const { data, error } = await supabase
  //     .from('alerts')
  //     .insert({ 
  //       anomaly_id: anomalyId, 
  //       responder_id: responderId
  //     })
  //     .single();
  //   if (error) console.log('error', error);
  //   else handleGoBack();
  // }

  async function addAlert() {
    try {
      const alertExists = await sentRequest(alertId)
      if (alertExists) {
        alert('Alert already exists in this id');
        return; // Exit the function if alert already exists
      }
      
      if (!responderId) {
        setResponderId(null);
      }
      //const { latitude, longitude } = await fetchCameraCoordinates(cameraId)

      const { data, error } = await supabase
        .from('alerts')
        .insert({ 
          id: alertId, 
          anomaly_id: anomalyId,
          created_at: new Date().toISOString(),
          responder_id: responderId,
          camera_id: cameraId,
          //latitude: latitude,
          //longitude: longitude
        })
        .single();

      if (error) {
        console.log('Error:', error);
      } else {
        handleGoBack();
      }
    } catch (error) {
      console.log('Error:', error);
    }

    
      
      
  }
  
  

  return (
    <div className='flex flex-col justify-center items-center'>
      <h1 className=' text-3xl'>Add Alert</h1>
      <form onSubmit={(e) => {
        e.preventDefault();
        addAlert();
      }} className='w-2/5'>
        <label>Alert Id:</label>
        <input type="text" value={alertId} onChange={(e) => setAlertId(e.target.value)} />        
        <label>Anomaly Id:</label>
        <input type="text" value={anomalyId} onChange={(e) => setAnomalyId(e.target.value)} />  
        <label>Camera Id:</label>
        <input type="text" value={cameraId} onChange={(e) => setCameraId(e.target.value)} /> 
        {/* <label>Longitude:</label>
        <input type="text" value={longitude} onChange={(e) => setLongitude(e.target.value)} />  */}
        <label>Responder Id:</label>
        <input type="text" value={responderId||''} onChange={(e) => setResponderId(e.target.value)} />
        <button type="submit" className='m-5'>Add Alert</button>
      </form>
    </div>
  );
}
