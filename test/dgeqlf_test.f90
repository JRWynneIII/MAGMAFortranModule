Program LinearEquations
  use magma
  use iso_c_binding
  Implicit none

  Real (KIND=C_DOUBLE) :: A(3,3), tau(3), work(3)
  integer (KIND=C_INT) :: m = 3, n = 3, lda = 3
  Integer (KIND=C_INT) :: i, j, lwork = 3, ok, status

  A(1,1)=3
  A(1,2)=1
  A(1,3)=5
  A(2,1)=1
  A(2,2)=6
  A(2,3)=5
  A(3,1)=3
  A(3,2)=7
  A(3,3)=8

  !status = MAGMA_DGEQLF(m, n, A, lda, tau, work, lwork, ok)
  status = MAGMA_DGEQLF(3,3,A,3,tau,work,lwork,ok)
  print*, "MAGMA"

  do i=1, 3
    do j = 1, 3
      write(*,*) A(i,j)
    end do
  end do

  A(1,1)=3
  A(1,2)=1
  A(1,3)=5
  A(2,1)=1
  A(2,2)=6
  A(2,3)=5
  A(3,1)=3
  A(3,2)=7
  A(3,3)=8
  print*, "LAPACK"

  call DGEQLF(3,3,A,3,tau,work,lwork,ok)

  do i=1, 3
    do j = 1, 3
      write(*,*) A(i,j)
    end do
  end do
end
