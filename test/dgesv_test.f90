Program LinearEquations
  use magma
  use iso_c_binding
  Implicit none

  Real (KIND=C_DOUBLE) :: A(3,3), b(3), C(3,3), d(3)
  Integer (KIND=C_INT) :: i, j, pivot(3), ok, status, k

  A(1,1)=3.1
  A(1,2)=1.3
  A(1,3)=-5.7
  A(2,1)=1.0
  A(2,2)=-6.9
  A(2,3)=5.8
  A(3,1)=3.4
  A(3,2)=7.2
  A(3,3)=-8.8

  b(1)=-1.3
  b(2)=-0.1
  b(3)=1.8

  print*, "Computing MAGMA"
  status = MAGMA_DGESV(3, 1, A, 3, pivot, b, 3, ok)


  C(1,1)=3.1
  C(1,2)=1.3
  C(1,3)=-5.7
  C(2,1)=1.0
  C(2,2)=-6.9
  C(2,3)=5.8
  C(3,1)=3.4
  C(3,2)=7.2
  C(3,3)=-8.8

  d(1)=-1.3
  d(2)=-0.1
  d(3)=1.8

  print*, "Computing LAPACK"
  call DGESV(3, 1, C, 3, pivot, d, 3, ok)

  do i=1, 3
    if (real(b(i)) /= real(d(i))) then
      print*, "TEST FAIL"
      do k=1, 3
          write(*,*) b(k)
      end do
      do k=1, 3
          write(*,*) d(k)
      end do
      call exit(1)
    endif
  end do
  print*, "TEST SUCCESSFUL!"
end
