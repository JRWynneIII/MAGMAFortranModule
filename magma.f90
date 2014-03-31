! This module is used to provide FORTRAN interfaces to the C functions and
! routines provided by MAGMA. To accomplish this, the ISO_C_BINDING module needs
! to be included so that all the variables are the right types for the C
! functions.
module magma
  Interface
      Integer function magma_sgesv(n, nrhs, A, ida, ipiv,B, idb, info) BIND (C, NAME="magma_sgesv")
        use iso_c_binding
        Implicit none
        integer (c_int),value::n
        integer (c_int),value::nrhs
        real (c_float)::A(*)
        integer (c_int),value::ida
        integer (c_int)::ipiv(*)
        real (c_float)::B(*)
        integer (c_int),value::idb
        integer (c_int)::info
      end function
   end Interface
  Interface
      Integer function magma_dgesv(n, nrhs, A, ida, ipiv,B, idb, info) BIND (C, NAME="magma_dgesv")
        use iso_c_binding
        Implicit none
        integer (c_int),value::n
        integer (c_int),value::nrhs
        real (c_double)::A(*)
        integer (c_int),value::ida
        integer (c_int)::ipiv(*)
        real (c_double)::B(*)
        integer (c_int),value::idb
        integer (c_int)::info
      end function
   end Interface
  Interface
      Integer function magma_dgetrf(m, n, a, ida, ipiv, info) BIND (C, NAME="magma_dgetrf")
        use iso_c_binding
        Implicit none
        integer (c_int),value::m
        integer (c_int),value::n
        real (c_double)::a(*)
        integer (c_int),value::ida
        integer (c_int)::ipiv(*)
        integer (c_int)::info
      end function
   end Interface
  Interface
      Integer function magma_dgeqrf(m, n, a, ida, tau, work, lwork, info) BIND (C, NAME="magma_dgeqrf")
        use iso_c_binding
        Implicit none
        integer (c_int),value::m
        integer (c_int),value::n
        real (c_double)::a(*)
        integer (c_int),value::ida
        real (c_double)::tau(*)
        real (c_double)::work(*)
        integer (c_int)::lwork
        integer (c_int)::info
      end function
   end Interface
  Interface
      Integer function magma_dpotrf(uplo, n, a, ida, info) BIND (C, NAME="magma_dpotrf")
        use iso_c_binding
        Implicit none
        character (c_char) :: uplo
        integer (c_int),value::n
        real (c_double)::a(*)
        integer (c_int),value::ida
        integer (c_int)::info
      end function
   end Interface
end module
