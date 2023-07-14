import { useEffect, useState, useRef } from 'react';
import LineChart from '../components/LineChart';

export default function Charts({anomalies, alerts}){
        const [labelsClass] = useState(['Fire/Explosion', 'Commotion/Group', 'Robbery/Assault', 'Vehicle Accident']);
        const [labelsYear] = useState([0, 2021, 2022, 2023])
        const [counts, setCounts] = useState<any>()
        const [data, setData] = useState<any>([])
        
        function classAnomaly(){
            setCounts([0,0,0,0])
            const countIn = [0,0,0,0]
             
            alerts.forEach((alert: any) => {
                const anomalyId = alert.anomaly_id
                countIn[anomalyId-1] += 1;
                }
            );
            setCounts(countIn)
            console.log('countIn ', countIn)
            console.log('data, label in classAnomaly: ', counts, labelsClass)
        }        

        function yearAlerts(){
            var count22=0, count23=0, count21=0
          alerts.map((alert:any) => {
            var year = alert.created_at.substring(0,4)
            // console.log(year)
            if(year == 2021) count21++;
            if(year == 2022) count22++;
            if(year == 2023) count23++;
          })
        //   console.log('counts: ', count21, count22, count23)
          setData([0, count21, count22, count23])
        //   console.log('data, label in yearAlerts: ', data, labelsYear)
        }
        
        useEffect(() => {
            yearAlerts();
            classAnomaly()
            // }, [alerts]);
    },[]);

    return(
        <div className="">
            {/* <div className="bg-white grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4"> */}
                <div className="m-2 p-5 bg-white rounded-xl">
                <LineChart data={data} labels={labelsYear} type='line' title='Anomalies per Year' />
                </div>
                <div className="m-2 p-5 bg-white rounded-xl"><LineChart data={counts} labels={labelsClass} type='bar' title='Count of Anomaly Class' /></div>
                
            {/* </div> */}
            
        </div>
    )
}