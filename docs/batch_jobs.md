# Submitting an R batch job

Now that we have our R script written for a cluster job, we need to write a script that runs that job. We'll use `nano` again here. 

The first step in writing your job script is to define the script interpreter (basically, telling the shell what language we'll be using):

```shell
#!/bin/bash
```

In this case, we're telling the shell that we're coding in bash. 

Next, we need to define the requests in our job so that the scheduler knows how much memory, how much time, and how much compute (CPUs or GPUs) we need. Here, since we're running a pretty small job, we'll just ask for 30 minutes, 1GB of memory, and 1 CPU. We'll also give our job a name so that it's easy to find in the queue. 

```shell
#SBATCH --time=00:00:30
#SBATCH --mem_per-cpu=1G
#SBATCH --cpus-per-task=1
#SBATCH --job-name="marias_lm"
```

While you do need to specify how much time you need for every job, you can choose not to specify your memory or compute needs. In those cases, you will be alloted a default amount by the system (256MB per core of memory, and one core). You would only ever use more than one core if your script was set up to run in parallel. 

!!! note ""
    For a full list of the options you can use to describe your job with SBATCH, you can run the following command `sbatch --help`. You can also find more information on setting up and running jobs in the [Alliance documentation](https://docs.alliancecan.ca/wiki/Running_jobs#Use_sbatch_to_submit_jobs). 

The last thing we need to do in our job script is to load an R module and run our R script. If your R script is not in the same folder as your job script, you'll need to add the file path. 

```shell
module load r/4.5.0
Rscript shell_script.R
```

To run your job, call `sbatch` followed by the same of your job script:

```shell
sbatch shell_script.sh
```

While it is running, you can watch its progress by calling `squeue` followed by your username, like so:

```shell
squeue -u finnsdot94
```

This command will print out information about your job, including:

- the job ID,
- the job name,
- the state of the job (R for running, PD for pending, and CG for completing),
- and the time remaining on the job.

<figure markdown="span">
    ![scatterplot](./content/queue_sbatch.png){width=600}
    <figcaption></figcaption>
</figure>

If you just call `squeue` alone, you'll get a list of all the jobs in the queue. 

Once your job is finished running, it will produce an output file called "slurm-##.out". You can open this file using `nano`. In it, you will find information about the status of your job (for example, where it failed if it did) as well as any output you printed from the R console.  

## Monitoring and evaluating a job.

Determining how much time and memory you need for a job is, to some extent, a trial and error sort of thing. (Remember, unless you're doing parallel processing, you're only using one core). Luckily, there are ways to measure how much memory your job is using, allowing you to refine your requests. 

It is generally good practice to request only as much as you need. Smaller jobs tend to run faster, and less wasteful jobs make the system run smoother for everyone. 

One way to tell if your job needed more memory or time than it had is to check the slurm output file. If you ran out of memory, you will find an "oom-kill" error. If you included printed checkpoints (like we did) you can also use those to judge whether your job needed more time than you give it. 

You can also check currently running jobs by using the `sstat` command followed by your job ID. You will also need to specify what information you want and how you want it formatted (otherwise it will print out a huge amount of data on your job), For example, to ask it to display how much memory is being used by job 16 in real time:

```shell
sstat 16.batch --format="JobID,MaxRSS" 
```
The code above specifies that this is job 16 and asks for the output to be given in the format of job id and then memory, like so:

```shell
JobID            MaxRSS 
------------ ---------- 
16.batch        188044K 
```

!!!note 
    For a complete list of what options you can use with the `sstat` command, run the following:

    ```shell
    sstat --help
    ```

## Downloading our output.



Finally, we can download our files from the remote server using `scp`