import { useEffect, useState } from 'react';

import { Camera } from '../types/Camera';
import { supabase } from "../../utils/supabaseClient";
import { useRouter } from 'next/router';

export default function Create() {
  const [cameras, setCameras] = useState<any>([]);
  const [description, setDescription] = useState<string>('');
  const [longitude, setLongitude] = useState<number>();
  const [latitude, setLatitude] = useState<number>();
  const [framerate, setFramerate] = useState<number>();
  const router = useRouter();

  useEffect(() => {
    fetchCameras();
  }, []);

  async function fetchCameras() {
    const { data, error } = await supabase.from('cameras').select('*');
    if (error) console.log('error', error);
    else setCameras(data);
  }
  const handleGoBack = () => {
    
    router.back();
  }

  async function addCamera() {
    const { data, error } = await supabase
      .from('cameras')
      .insert({ camera_description: description, coordinates: {
        lat: latitude,
        lng: longitude
      },
    frame_rate: framerate, latitude: latitude, longitude: longitude })
      .single();
    if (error) console.log('error', error);
    else handleGoBack();
    // else setCameras([...cameras, data]);
  }

  return (
    <div className='flex flex-col justify-center items-center'>
      <h1 className=' text-3xl'>Add Camera</h1>
      <form onSubmit={(e) => {
        e.preventDefault();
        addCamera();
      }} className='w-2/5'>
        <label>Description:</label>
        <input type="text" value={description} onChange={(e) => setDescription(e.target.value)} />
        <label>Longitude:</label>
        <input type="number" value={longitude} onChange={(e) => setLongitude(Number(e.target.value))} />
        <label>Latitude:</label>
        <input type="number" value={latitude} onChange={(e) => setLatitude(Number(e.target.value))} />
        <label>Frame Rate:</label>
        <input type="number" value={framerate} onChange={(e) => setFramerate(Number(e.target.value))} />
        <button type="submit" className='m-5'>Add Camera</button>
      </form>
    </div>
  );
}
