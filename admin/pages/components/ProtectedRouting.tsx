import { useUser } from '@supabase/auth-helpers-react'
import { toast } from "react-toastify";
import { useRouter } from 'next/router';

export default function ProtectedRouting() {

  const user = useUser()
  const router = useRouter() //can't use

  if(!user) {
    // alert('no user')
    toast('user no')
    router.push('/')
  }
  
  return
}
