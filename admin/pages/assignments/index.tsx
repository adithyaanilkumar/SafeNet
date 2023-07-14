import { JSXElementConstructor, Key, ReactElement, ReactFragment, useEffect, useState } from 'react';

import { Assignment } from '../types/Assignment';
import Navbar from '../components/Navbar';
import { supabase } from '../../utils/supabaseClient';
import { timer_duration } from "@/constants";
import { useUser } from '@supabase/auth-helpers-react';

export default function Assignments() {
  const [assignments, setAssignments] = useState<any>([]);
  const user = useUser()

  useEffect(() => {
    const fetchAssignments = async () => {
        const { data, error } = await supabase
          .from('assignments')
          .select("*");
        if (error) throw error;
        setAssignments(data);
        console.log(data)
    };
    fetchAssignments();
    
    const timer = setInterval( ()=>{
      console.log(`this runs every ${timer_duration} sec`)
      fetchAssignments();
    },timer_duration)

    return ()=>{
      clearInterval(timer)
    }
    
   
  }, []);

  async function deleteAlert(assignmentId: string) {
    const { error } = await supabase.from('assignments').delete().eq('id', assignmentId)
    if (error) console.log('error', error);
    else {
      const updatedAssignments = assignments.filter((assignment) => assignment.id !== assignmentId);
      setAssignments(updatedAssignments);
    }
  }

  async function handleAccept(alertId:string, assignmentId: string) {
    console.log('in accept')
        const { error } = await supabase
        .from('alerts')
        .update({ isAccepted: true, 
          //responder_id: user.id, sentRequest: null  
        })
        .eq('id', (alertId))

        if (error) throw error;
        else deleteAlert(assignmentId)

  }
  async function handleDeny(alertId:any, assignmentId: string) {
      const { error } = await supabase
      .from('alerts') 
      .update({ isAccepted: false, responder_id: null, sentRequest: null })
      .eq('id', alertId)

      if (error) throw error;
      else deleteAlert(assignmentId)
  }


  return (
    <div className="h-screen w-screeen flex justify-center">
        <div className="basis-1/5">
            <Navbar/>
        </div>
        <div className="basis-4/5 p-10">
        {/* <div className="topbar h-15 m-5">
                <p className="text-white">TO ADD A NEW RESPONDER: please create a new account with the corresponding details</p> 
            </div> */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {
            assignments.filter((assignment: { responder_id: string; }) => assignment.responder_id == '') //user.id instead of ''
            .map((assignment: { id: boolean | Key | ReactElement<any, string | JSXElementConstructor<any>> | ReactFragment | null | undefined; alert_id: string | number | boolean | ReactElement<any, string | JSXElementConstructor<any>> | ReactFragment | null | undefined; }) => (
            <div
                key={assignment.id}
                className="bg-white rounded-lg shadow-md p-4 cursor-pointer"
            >
                <p className="text-lg text-black font-semibold my-2">Alert Id: {assignment.alert_id}</p>
                <h3 className="text-black">Assignment Id: {assignment.id}</h3>
              
                <div className="flex m-2 w-4/5 justify-around">
                <button onClick={() => handleAccept(assignment.alert_id, assignment.id)}>Accept</button>
                <button onClick={() => {handleDeny(assignment.alert_id, assignment.id)}}>Deny</button>
                </div> 
                
            </div>
            ))}
            </div>
        </div>
        </div>
  );
}
