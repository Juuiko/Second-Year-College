int x[4];         //are frogs free
int loc[5];       //where frogs are

proctype PerformMove(int frog; int pos; int free){
   atomic{
   loc[free]=frog;
   loc[pos]=0;
   printf("\nFROG%d FROM %d TO %d",frog,pos+1,free+1);
   x[0]=0;
   x[1]=0;
   x[2]=0;
   x[3]=0;
   run PrintLocs();
   (_nr_pr == 2);
   }
}

proctype PrintLocs(){
      int i, j, k, l, m;
      if
       :: loc[0]==0 -> i=1;
       :: loc[1]==0 -> i=2;
       :: loc[2]==0 -> i=3;
       :: loc[3]==0 -> i=4;
       :: loc[4]==0 -> i=5;
      fi

      if
       :: loc[0]==1 -> j=1;
       :: loc[1]==1 -> j=2;
       :: loc[2]==1 -> j=3;
       :: loc[3]==1 -> j=4;
       :: loc[4]==1 -> j=5;
      fi

      if
       :: loc[0]==2 -> k=1;
       :: loc[1]==2 -> k=2;
       :: loc[2]==2 -> k=3;
       :: loc[3]==2 -> k=4;
       :: loc[4]==2 -> k=5;
      fi

      if
       :: loc[0]==3 -> l=1;
       :: loc[1]==3 -> l=2;
       :: loc[2]==3 -> l=3;
       :: loc[3]==3 -> l=4;
       :: loc[4]==3 -> l=5;
      fi

      if
       :: loc[0]==4 -> m=1;
       :: loc[1]==4 -> m=2;
       :: loc[2]==4 -> m=3;
       :: loc[3]==4 -> m=4;
       :: loc[4]==4 -> m=5;
      fi

      printf("\nEMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d",i,j,k,l,m);
}

init {
   atomic{
   x[0]=0;
   x[1]=0;
   x[2]=0;
   x[3]=0;
   loc[0]=1;
   loc[1]=2;
   loc[2]=0;
   loc[3]=3;
   loc[4]=4;

   run PrintLocs();
   (_nr_pr == 1);


// <------CHOOSE A FROG AND TRY TO MOVE IT----->
   do
   :: true ->
             int frog, pos;
             if                               //randomly choose frog if not already stuck
              :: x[0]==0 -> frog=1;
              :: x[1]==0 -> frog=2;
              :: x[2]==0 -> frog=3;
              :: x[3]==0 -> frog=4;
              :: loc[2]==0 && x[0]==1 && x[1]==1 && x[2]==1 && x[3]==1 -> assert(!true); break;
              :: else -> printf("\n\nWrong Answer\n"); break;
             fi

             if                               //find where randomly chosen frog is
              :: loc[0]==frog -> pos=1;
              :: loc[1]==frog -> pos=2;
              :: loc[2]==frog -> pos=3;
              :: loc[3]==frog -> pos=4;
              :: loc[4]==frog -> pos=5;
             fi

             if
              :: frog==1||frog==2 -> printf("\nFROG%d (RIGHT) STARTS AT %d",frog,pos) ->
                    if
                     :: pos<=4&&loc[pos]==0 -> run PerformMove(frog,pos-1,pos);       //if one space right is free, switch
                     :: pos<=3&&loc[pos+1]==0 -> run PerformMove(frog,pos-1,pos+1);     //if twp spaces right are free, switch
                     :: else -> x[frog-1]=1;
                    fi;
              :: frog==3||frog==4 -> printf("\nFROG%d (LEFT) STARTS AT %d",frog,pos) ->
                    if
                     :: pos>=2&&loc[pos-2]==0 -> run PerformMove(frog,pos-1,pos-2);       //if one space right is free, switch
                     :: pos>=3&&loc[pos-3]==0 -> run PerformMove(frog,pos-1,pos-3);     //if twp spaces right are free, switch
                     :: else -> x[frog-1]=1;
                    fi;
             fi
             (_nr_pr == 1);
   od;
   }


   (_nr_pr == 1);
}
