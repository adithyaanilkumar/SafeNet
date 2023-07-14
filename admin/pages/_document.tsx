import { Html, Head, Main, NextScript } from "next/document";
import { useUser } from '@supabase/auth-helpers-react'
import { toast } from "react-toastify";

export default function Document() {

  const user = useUser()
  // const router = useRouter() //can't use

  if(!user) {
    // alert('no user')
    toast('user no')
  }
  
  return (
    <Html lang='en'>
      <Head />
      <body>
        <Main />
        <NextScript />
      </body>
    </Html>
  );
}
