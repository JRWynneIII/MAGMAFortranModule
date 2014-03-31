Program LinearEquations
  use magma
  use iso_c_binding
  Implicit none

  Real (KIND=C_DOUBLE) :: A(3,3), B(3,3)
  Character (KIND=C_CHAR), parameter :: uplo = "U"
  Integer (KIND=C_INT), parameter :: n = 3, lda = 3
  Integer (KIND=C_INT) :: i,j,k,l,ok,status

  A(1,1)=3
  A(1,2)=1
  A(1,3)=5
  A(2,1)=1
  A(2,2)=6
  A(2,3)=5
  A(3,1)=3
  A(3,2)=7
  A(3,3)=8

  print*, "Computing MAGMA"

  status = MAGMA_DPOTRF(uplo, n, a, lda, ok)

  B(1,1)=3
  B(1,2)=1
  B(1,3)=5
  B(2,1)=1
  B(2,2)=6
  B(2,3)=5
  B(3,1)=3
  B(3,2)=7
  B(3,3)=8
  print*, "Computing LAPACK"

  call DPOTRF(uplo, n, B, lda, ok)

  do i=1, 3
    do j = 1, 3
      if (real(A(i,j)) /= real(B(i,j))) then
        print*, "TEST FAIL"
        do k=1, 3
          do l = 1, 3
            write(*,*) A(k,l)
          end do
        end do
        do k=1, 3
          do l = 1, 3
            write(*,*) B(k,l)
          end do
        end do
        call exit(1)
      endif
    end do
  end do
  print*, "TEST SUCCESSFUL!"
end
