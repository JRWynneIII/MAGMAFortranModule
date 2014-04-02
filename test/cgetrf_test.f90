Program LinearEquations
  use magma
  use iso_c_binding
  Implicit none

  COMPLEX (KIND=C_FLOAT_COMPLEX) :: A(3,3), C(3,3)
  Integer (KIND=C_INT) :: i, j, k, l, pivot(3), ok, status

  A(1,1)=(3,2)
  A(1,2)=(1,3)
  A(1,3)=(5,4)
  A(2,1)=(1,1)
  A(2,2)=(6,6)
  A(2,3)=(5,2)
  A(3,1)=(3,3)
  A(3,2)=(7,3)
  A(3,3)=(8,3)

  print*, "Computing Magma"

  status = MAGMA_CGETRF(3, 3, A, 3, pivot, ok)

  C(1,1)=(3,2)
  C(1,2)=(1,3)
  C(1,3)=(5,4)
  C(2,1)=(1,1)
  C(2,2)=(6,6)
  C(2,3)=(5,2)
  C(3,1)=(3,3)
  C(3,2)=(7,3)
  C(3,3)=(8,3)
  print*, "Computing LAPACK"

  call CGETRF(3,3,C,3,pivot,ok)

  do i=1, 3
    do j = 1, 3
      if (real(A(i,j)) /= real(C(i,j))) then
        print*, "TEST FAIL"
        do k=1, 3
          do l = 1, 3
            write(*,*) A(k,l)
          end do
        end do
        do k=1, 3
          do l = 1, 3
            write(*,*) C(k,l)
          end do
        end do
        call exit(1)
      endif
    end do
  end do
  print*, "TEST SUCCESSFUL!"
end
