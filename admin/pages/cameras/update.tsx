import { useState, useEffect } from 'react';
import { Camera } from '../types/Camera'; 
import { supabase } from "../../utils/supabaseClient";
import { useRouter } from 'next/router';
import { useUser } from "@supabase/auth-helpers-react";

// export default function Update( oldId: any) {
export default function Update() {
  const [cameras, setCameras] = useState<Camera[]>([]);
  const [id, setId] = useState<string>('');
  const [description, setDescription] = useState<string>();
  const [longitude, setLongitude] = useState<number>();
  const [latitude, setLatitude] = useState<number>();
  const [framerate, setFramerate] = useState<number>();
  const router = useRouter();
  const user = useUser();

  const oldId = router.query.myArgument;
  console.log('oldId: ', oldId)

  useEffect(() => {
    async function fetchCameras() {
      const { data, error } = await supabase
        .from('cameras')
        .select()
        .eq('id', (oldId));
      if (error) console.log('error', error);
      else setCameras(data);
    }
    
    console.log(cameras)
    setDescription(cameras[0].camera_description)
    setLongitude(cameras[0].longitude)
    setLatitude(cameras[0].latitude)
    setFramerate(cameras[0].frame_rate)
    fetchCameras();
    // setDescription(cameras)
    console.log('cameras: ', cameras)
  }, [oldId]);

  const handleGoBack = () => {
    
    router.back();
  }

  // async function updateCamera(id: string, updates: Partial<Camera>) {
    async function updateCamera() {
    const { error } = await supabase
        .from('cameras')
        .update({ 
          frame_rate: framerate,
          latitude: latitude,
          longitude: longitude,
          camera_description: description
        })
        .eq('id', oldId)
    if (error) console.log('error', error);
    else {
      // const updatedCameras = cameras.map((camera) =>
      //   camera.id === data.id ? { ...camera, ...data } : camera
      // );
      // setCameras(updatedCameras);
      handleGoBack()
    }
  }

  return (
    <div className='flex flex-col justify-center items-center'>
      <h1 className=' text-3xl'>Update Camera</h1>
      <form onSubmit={(e) => {
        e.preventDefault();
        updateCamera();
      }} className='w-2/5'>
        <label>Description:</label>
        <input type="text" value={description} onChange={(e) => setDescription(e.target.value)} />
        <label>Longitude:</label>
        <input type="number" value={longitude} onChange={(e) => setLongitude(Number(e.target.value))} />
        <label>Latitude:</label>
        <input type="number" value={latitude} onChange={(e) => setLatitude(Number(e.target.value))} />
        <label>Frame Rate:</label>
        <input type="number" value={framerate} onChange={(e) => setFramerate(Number(e.target.value))} />
        <button type="submit" className='m-5'>Update Camera</button>
      </form>
    </div>
  );
}
