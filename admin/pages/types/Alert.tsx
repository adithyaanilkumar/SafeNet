export type Alert = {
    id: string;
    anomaly_id: string;
    responder_id: string | null;
    isAccepted: Boolean;
    sentRequest: Boolean;
    responder: string;
    anomaly: string;
  };
  