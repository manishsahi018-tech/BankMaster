#include <dos.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>


long count=0, total=0;
int first=0;
int yy,mm,dd;
int jmon[13] = {0,0,31,59,90,120,151,181,212,243,273,304,334};
char tempfield[30];
unsigned char newrec[1024];
char spaces[256];
char drtst[20];
char start_date[12];
char pstart_date[12];
char end_date[12];
char lst_tr_date[12];
char prev_date[12];
char curr_date[12];

long firstjday, lastjday, diffday, prevjday, days, pdays, ndays;
long anbatm=0, spanatm=0, pos=0, brtr=0;
int brno;
double d_count=0, c_count=0, tranave;
double c_amount=0, d_amount=0, b_amount=0, p_amount=0;
double max_cr=0, max_dr=0, max_bal=0, min_bal=0;
double total_dr=0, total_cr=0;
char max_cr_date[10], max_dr_date[10], max_bal_date[10], min_bal_date[10];
double totalamount=0;
double ptotalamount=0;
double ntotalamount=0;

char charbr[6];
char acc_no[20];
int  numbr=0, lang=1, i;
int missing=0;
char missingdays[200];
char tempbuf[64];

FILE *xn, *xo;

main(argc, argv)
int argc;
char *argv[];
{
   struct date d;



   if(argc > 1)
    xn = fopen(argv[1], "r");
   else
    xn = fopen("C:\\TEMP\\PRTALL.$S!", "r");
    if(xn == NULL)
    {
      printf("Cannot open input file.\n");
      return 1;
    }

   if(argc > 2)
    xo = fopen(argv[2], "w");
   else
    xo = fopen("C:\\TEMP\\ANALYSIS.$A!", "w");
    if(xo == NULL)
    {
      printf("Cannot open output file.\n");
      return 1;
    }

  printf("\n\n\n");

  memset(spaces, ' ', 250);

  while(fgets(newrec, 250, xn))
    {
        if(newrec[0] == 12)
        {
          numbr=0;
          if(newrec[3] == 0)
          numbr=-1;
        }                   
                          
        numbr++;
        if(numbr == 11)
          {
            for(i=12; i<56;i++)
              if(newrec[i] > 127)
                 lang=0;
          }
        if(numbr == 12)
          {
            if(lang==1)
              {
               if(newrec[26] == '/')
                 sprintf(acc_no, "%.5s%.7s%.2s  ", &newrec[13], &newrec[19], &newrec[27]);
               else
                 sprintf(acc_no, "%.5s%.6s%.2s  ", &newrec[13], &newrec[19], &newrec[26]);
              }
             else
              {
               if(newrec[64] == '/')
                 sprintf(acc_no, "%.5s%.7s%.2s  ", &newrec[65], &newrec[57], &newrec[54]);
               else
                 sprintf(acc_no, "%.5s%.6s%.2s  ", &newrec[64], &newrec[57], &newrec[54]);
              }
          }

        if(numbr == 14)
          {
          if(newrec[59 - lang*44] == '/')
            sprintf(end_date, "%.10s ", &newrec[54 - lang*41]);
          }

      if(newrec[lang*79 + 6] == '/')
        {

          dd = atoi(&newrec[lang*79 + 4]);
          mm = atoi(&newrec[lang*79 + 7]);
          yy = atoi(&newrec[lang*79 + 10]);
          if(yy < 80) yy +=2000;                  /* Y2K */
          else
          if(yy < 100) yy +=1900;                  /* Y2K */
          newrec[63 - lang*19] = '!';
          d_amount=atof(&newrec[50 - lang*19]);
          total_dr += d_amount;

          newrec[78 - lang*46] = '!';
          c_amount=atof(&newrec[64 - lang*46]);
          total_cr += c_amount;

          if(memcmp(&newrec[52 - lang*11], "  ", 2) != 0)    d_count++;
          if(memcmp(&newrec[65 - lang*39], "  ", 2) != 0)    c_count++;

          if(first == 0)
            {
             sprintf(start_date, "%.8s ", &newrec[lang*79 + 4]);
             firstjday= yy*365 + jmon[mm]+dd;
             prevjday=firstjday;
             lastjday=firstjday;
             first++;
             max_cr = c_amount;
             memcpy(max_cr_date,  &newrec[lang*79 + 4], 8);
             max_dr = d_amount;
             memcpy(max_dr_date,  &newrec[lang*79 + 4], 8);
             b_amount=atof(&newrec[81 - lang*80]);
           if(newrec[80] == 229 || (newrec[14] == 'D' && newrec[88] == '/' ))
               b_amount= -b_amount;

             max_bal = b_amount;
             memcpy(max_bal_date, &newrec[lang*79 + 4], 8);
             min_bal = b_amount;
             memcpy(min_bal_date, &newrec[lang*79 + 4], 8);
            }

          lastjday= yy*365 + jmon[mm]+dd;

          diffday=lastjday-prevjday;
          if(diffday < 0)
           {
             diffday = 0;
             lastjday=prevjday;
           }
          if(diffday > 0)
           {
             totalamount+= b_amount*diffday;
             if(b_amount < 0)
               {
                 ndays += diffday;
                 ntotalamount += b_amount*diffday;
               }
             else
               {
                 ptotalamount+= b_amount*diffday;
                 pdays += diffday;
               }
           }


          b_amount=atof(&newrec[81 - lang*80]);
          if(newrec[80] == 229 || (newrec[14] == 'D' && newrec[88] == '/' ))
             b_amount= -b_amount;

            p_amount= p_amount + c_amount - d_amount;

          sprintf(curr_date, "%.8s ", &newrec[lang*79 + 4]);
          if(c_amount == 0 && d_amount == 0)
          if(b_amount - p_amount > .01 || b_amount - p_amount < -.01 )
          {
          if(diffday > 2)
            {
             missing++;
             sprintf(tempbuf, "% 5u.   %.8s - %.8s\n", missing, prev_date, curr_date);
             strcat(missingdays, tempbuf);
            }
             p_amount = b_amount;
          }
          sprintf(prev_date, "%.8s ", &newrec[lang*79 + 4]);

          prevjday=lastjday;

          if(c_amount > max_cr)
           {
            max_cr = c_amount;
            memcpy(max_cr_date, &newrec[lang*79 + 4], 8);
           }

          if(d_amount > max_dr)
           {
            max_dr = d_amount;
            memcpy(max_dr_date, &newrec[lang*79 + 4], 8);
           }

          if(b_amount > max_bal)
           {
            max_bal = b_amount;
            memcpy(max_bal_date, &newrec[lang*79 + 4], 8);
           }

          if(b_amount < min_bal)
           {
            min_bal = b_amount;
            memcpy(min_bal_date, &newrec[lang*79 + 4], 8);
           }

         days=lastjday-firstjday+1;         

         brno = 0;
         if(lang == 1)
           {
            brno = atoi(&newrec[92]);
            if(brno > 100 && brno < 399 && brno != 197 && brno != 198 && brno != 199 && brno != 299)
            brtr++;
            if(memcmp("WITHDRAWAL - ATM(OTHERS) ", &newrec[55], 23) == 0)
              spanatm++;
            else
            if(memcmp("WITHDRAWAL - ATM         ", &newrec[55], 23) == 0)
              anbatm++;
            else
            if(memcmp("POS                      ", &newrec[55], 23) == 0)
              pos++;
           }
         else
           {
            brno = atoi(newrec);
            if(brno > 100 && brno < 399 && brno != 197 && brno != 198 && brno != 199 && brno != 299)
            brtr++;
            if(memcmp("ÓÍÈ ÕÑÇá Âäê - Èæèã ÃÎÑé ", &newrec[14], 23) == 0)
              spanatm++;
            else
            if(memcmp("ÓÍÈ ÕÑÇá Âäê             ", &newrec[14], 23) == 0)
              anbatm++;
            else
            if(memcmp("åÔÊÑêÇÊ - æâÇ× ÇäÈêÙ     ", &newrec[14], 23) == 0)
              pos++;
           }

        }
        memset(newrec, 0, 200);
    }

dd = atoi(end_date);
mm = atoi(&end_date[3]);
yy = atoi(&end_date[6]);
if(yy < 80) yy  += 2000;                            /* Y2K */
else
if(yy < 100) yy += 1900;                            /* Y2K */
lastjday = yy*365 + jmon[mm]+dd;

if(lastjday < prevjday)                /* If FF is missing  */
   {
    lastjday = prevjday;
    yy = atoi(&curr_date[6]);
    if(yy < 80) sprintf(end_date, "%.6s%4u ", curr_date, yy+2000);
    else        
    if(yy < 100)   sprintf(end_date, "%.6s%4u ", curr_date, yy+1900);
   }

diffday=lastjday-prevjday;
if(diffday > 0)
 {
    totalamount+= b_amount*diffday;
    if(b_amount < 0)
      {
        ndays += diffday;
        ntotalamount += b_amount*diffday;
      }
    else
      {
        ptotalamount+= b_amount*diffday;
        pdays += diffday;
      }
 }

days=lastjday-firstjday;

getdate(&d);
fprintf(xo, "`fl\n");
fprintf(xo, "\n%.23sArab National Bank%.23s %d/%d/%d\n\n", spaces, spaces, d.da_day, d.da_mon, d.da_year);

fprintf(xo, "%.23sStatement Analysis v3.0\n\n\n\n\n\n\n", spaces);
fprintf(xo, "Account Number: %.14s\n\n", acc_no);

yy = atoi(&start_date[6]);
if(yy > 80) sprintf(pstart_date, "%.6s%4u ", start_date, yy+1900);
else        sprintf(pstart_date, "%.6s%4u ", start_date, yy+2000);

fprintf(xo, "Analysis Period: %s  -  %s\n\n\n", pstart_date, end_date);

/* fprintf(xo, "Analysis Period: %s  -  %s\n\n\n", start_date, end_date); */
fprintf(xo, "Largest Deposit Amount     : % 14.2f    Occurred on %s \n\n",max_cr,  max_cr_date );
fprintf(xo, "Largest Withdrawal Amount  : % 14.2f    Occurred on %s \n\n\n",max_dr,  max_dr_date );
fprintf(xo, "Highest Balance            : % 14.2f    Occurred on %s \n\n",max_bal, max_bal_date);
fprintf(xo, "Lowest Balance             : % 14.2f    Occurred on %s \n\n\n",min_bal, min_bal_date);
fprintf(xo, "Number of Deposits         :% 14.0f\n\n", c_count);
fprintf(xo, "Total Amount of Deposits   :% 14.2f\n\n", total_cr);
if(c_count > 0)
 fprintf(xo, "Average Deposit Amount     :% 14.2f\n\n\n", total_cr/c_count);
else
 fprintf(xo, "Average Deposit Amount     :% 14.2f\n\n\n", total_cr);
fprintf(xo, "Number of Withdrawals      :% 14.0f\n\n", d_count);
fprintf(xo, "Total Amount of Withdrawals:% 14.2f\n\n", total_dr);
if(d_count > 0)
  fprintf(xo, "Average Withdrawal Amount  :% 14.2f\n\n", total_dr/d_count);
else
  fprintf(xo, "Average Withdrawal Amount  :% 14.2f\n\n", total_dr);

fprintf(xo, "Number of days in debit    :% 6ld  ", ndays);
if(ndays > 0)
fprintf(xo, "Average Daily Balance :% 14.2f", ntotalamount/ndays);
fprintf(xo, "\n\n");

fprintf(xo, "Number of days in credit   :% 6ld  ", pdays);
if(pdays > 0)
fprintf(xo, "Average Daily Balance :% 14.2f", ptotalamount/pdays);
fprintf(xo, "\n\n");

if(days > 0)
fprintf(xo, "Average Daily Balance      : % 14.2f\n\n", totalamount/days);


fprintf(xo, "Branch Transactions        :         % 6ld\n\n",  brtr);
fprintf(xo, "ATM Card Transactions      :       ANB:% 4ld\n",  anbatm);
fprintf(xo, "                                  SPAN:% 4ld\n", spanatm);
fprintf(xo, "                                   POS:% 4ld\n\n",   pos);

if(missing > 0)
fprintf(xo, "\n\nMissing statements for the following periods:\n\n%s\n\n", missingdays);


fprintf(xo, "%.22s*** End Of Report ***\n", spaces);

fclose(xn);
fclose(xo);

printf("\nDone.\n");
return 0;
}

