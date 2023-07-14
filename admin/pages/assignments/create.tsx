import { useEffect, useState } from 'react';

import { Alert } from '../types/Alert';
import { Assignment } from '../types/Assignment';
import { supabase } from "../../utils/supabaseClient";
import { useRouter } from 'next/router';

export default function Create() {
  const [id, setId] = useState<string>('');
  const [alertId, setAlertId] = useState<string>('');
  const [responderId, setResponderId] = useState<string>('');
  const router = useRouter();

  const handleGoBack = () => {
    router.back();
  }


  async function addAssignment(responder: any, alertId: string, id: string) {
    const { data, error } = await supabase
      .from('assignments')
      .insert({
        alert_id: alertId,
        responder_id: responder,
      })
      .single();
    if (error) console.log('error', error);
    else{
      setId('');
    // setSelectedResponder(null);
    console.log('assignment insert success')
  }


  return (
    <div className='h-screen w-screen flex flex-col justify-center items-center'>
      <h1 className=' text-3xl'>Add Camera</h1>
      <form onSubmit={(e) => {
        e.preventDefault();
        // addAssignment();
      }} className='w-2/5'>
        <label>Id:</label>
        <input type="text" value={id} onChange={(e) => setId(e.target.value)} />
        {/* <label>Responder Id:</label>
        <input type="text" value={responderId} onChange={(e) => setResponderId(e.target.value)} />
        <label>Anomaly Id:</label>
        <input type="text" value={alertId} onChange={(e) => setAlertId(e.target.value)} />         */}
        <button type="submit" className='m-5'>Add Camera</button>
      </form>
    </div>
  );
}
}
