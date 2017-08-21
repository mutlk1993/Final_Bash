#!/bin/bash 

user_input="" # for the while loop


main(){
while [ -z $user_input ]; do
	echo "please specify what you want to do: 1) to check the password against the stored one.   2- to kill a specific process by their PID. 3) To list all the system's current processes: "
	read user_input 
	echo "you chose: $user_input	 " # this one can be delteted but I just need it to chek my work
	
	
	if [ $user_input -eq 1 ]; then #this function is to compare the input hashtag with the stored one which is "Welcome"
		fun_MD5
	elif [ $user_input -eq 2 ]; then #this function is to list the current processing system (PID & CMD).
		fun_process
	elif [ $user_input -eq 3 ]; then  #this function is to kill a specified function that you get from the previous function.
		fun_kill_process
	fi
	

done


}



fun_MD5() { #this function is to compare the stored hash with the one that user provide.

 user_in="" #the user's input you want it to be compare with.
 compared_hash="83218ac34c1834c26781fe4bde918ee4" # a hash value of Welcome.

 while [ -z $user_in ]; do # if the user's input (user_in) is blank, then you need to enter something to be compared
   echo "please enter a password to be hash: " # a message telling you what to do
   read user_in #to read from the user_in
   huser_in="$(echo -n $user_in | md5sum | cut -d' ' -f1)" # to hash the user_in so it can be evaluated.
   echo $huser_in
   if [ "$huser_in" == "$compared_hash" ]; then #if it's successfuly compared, then show the following message, else say "Failed"
      echo "Password is Equaled"

     
   else
	echo "Failed" # if it failed to be match, then show this message.
   fi

#main #to call the man function in order to run the while menu again.
done

}

fun_kill_process() { #function number 3 
 #pkill=""
 #echo "what process do you want to kill? "
 read -p "what is the process ID you want to kill? " pkill # provide the PID you want to kill.
 kill $pkill # kill the provided pid
 echo "PID $pkill is killed!!!" #satisfication message that this pid is killed.

main 
}

fun_process() { #function number 2 to list all the current system's processes by their PID and CMD.
	ps -e -o pid,cmd
main
}

main



