// @ts-nocheck
import "leaflet/dist/leaflet.css";
import "leaflet-defaulticon-compatibility/dist/leaflet-defaulticon-compatibility.css";
import "leaflet-defaulticon-compatibility";

import { MapContainer, Marker, Popup, TileLayer } from "react-leaflet";
import { useEffect, useState } from "react";

import AlertCard from "./AlertCard";
import React from "react";
import { supabase } from "../../utils/supabaseClient";
import { timer_duration } from "@/constants";

const Map = () => {
  const [alerts, setAlerts] = useState([]);
  const [responders, setResponders] = useState([]);
  const [cameras, setCameras] = useState([]);

  useEffect(() => {
    const fetchMarkers = async () => {
      try {
        const { data: alertsData, error: alertsError } = await supabase
          .from("alerts")
          .select("*");

        const { data: camerasData, error: camerasError } = await supabase
          .from("cameras")
          .select("*");

        if (alertsError) throw alertsError;
        if (camerasError) throw camerasError;

        setAlerts(alertsData);
        setCameras(camerasData);
      } catch (error) {
        console.error("Error fetching markers:", error);
      }
    };

    const fetchResponders = async () => {
      try {
        const { data, error } = await supabase.from("profiles").select("*");
        if (error) throw error;
        setResponders(data);
      } catch (error) {
        console.error("Error fetching responders:", error);
      }
    };

    fetchMarkers();
    fetchResponders();
    const timer = setInterval(() => {
      console.log(`this runs every ${timer_duration} sec`);
      fetchMarkers();
      fetchResponders();
    }, timer_duration);

    return () => {
      clearInterval(timer);
    };
  }, []);

  async function deleteAlert(id: string) {
    try {
      const { error } = await supabase.from("alerts").delete().match({ id });
      if (error) throw error;

      const updatedAlerts = alerts.filter(
        (alert: { id: string }) => alert.id !== id
      );
      setAlerts(updatedAlerts);
    } catch (error) {
      console.log("Error deleting alert:", error);
    }
  }

  const getMarkerIcon = (anomalyId) => {
    let iconColor = "blue";
  
    switch (anomalyId) {
      case 1:
        iconColor = "blue";
        break;
      case 2:
        iconColor = "red";
        break;
      case 3:
        iconColor = "violet";
        break;
      case 4:
        iconColor = "yellow";
        break;
      default:
        iconColor = "green";
    }
  
    return L.icon({
      iconUrl: `https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-${iconColor}.png`,
      shadowUrl: "https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.7.1/images/marker-shadow.png",
      iconSize: [25, 41],
      iconAnchor: [12, 41],
      popupAnchor: [1, -34],
      shadowSize: [41, 41],
    });
  };
  

  
  return (
    <div className="container w-full h-full" style={{ height: "90vh", width: "90vw" }}>
      <MapContainer center={[10.0284, 76.3285]} zoom={14} scrollWheelZoom={false} style={{ height: "100%", width: "100%" }}>
        <TileLayer
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          attribution='&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        />
  
        {alerts.map((alert) => {
          const associatedCamera = cameras.find((camera) => camera.id === alert.camera_id);
  
          if (associatedCamera) {
            const { latitude, longitude } = associatedCamera;
            const markerIcon = getMarkerIcon(alert.anomaly_id);
  
            return (
              <Marker key={alert.id} position={[latitude, longitude]} icon={markerIcon}>
                <Popup>
                  <div>
                    {/* <h3>Alert ID: {alert.id}</h3>
                    <p>Camera ID: {alert.camera_id}</p> */}
                    <AlertCard responders={responders} alert={alert} deleteAlert={deleteAlert} />
                  </div>
                </Popup>
              </Marker>
            );
          }
  
          return null;
        })}
      </MapContainer>
    </div>
  );
};  


export default Map;
 
