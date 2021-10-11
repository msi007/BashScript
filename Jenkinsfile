pipeline{
    agent{label 'reveT90'}
      stages{ 
          stage("Switch Sigaling jar change"){
              steps{
				  sh 'chmod a+x /home/workspace/Project_switchJar_Update/deploy_switch_jar.sh'	
                  sh 'sh /home/workspace/Project_switchJar_Update/deploy_switch_jar.sh'
                 
              }
              
          }
     }
}	 