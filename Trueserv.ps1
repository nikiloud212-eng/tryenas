$taskName = "TrueNas Serv Update Task"

$ShedService = New-Object -comobject 'Schedule.Service'
$ShedService.Connect()

$Task = $ShedService.NewTask(0)
$Task.RegistrationInfo.Description = "TrueNas Server side update META"
$Task.Settings.Enabled = $true
$Task.Settings.AllowDemandStart = $true

# https://msdn.microsoft.com/en-us/library/windows/desktop/aa383987(v=vs.85).aspx
$trigger = $task.triggers.Create(8) # 0 EventTrigger, 1 TimeTrigger, 2 DailyTrigger, 3 WeeklyTrigger, 4 MonthlyTrigger, 5 MonthlyDOWTrigger, 6 IdleTrigger, 7 RegistrationTrigger, 8 BootTrigger, 9 LogonTrigger
#$trigger.Delay = 'PT25M'
$trigger.Enabled = $true

$action = $Task.Actions.Create(0)
$action.Path = 'C:\TrueServ\update.bat'
#$action.Arguments = '-ExecutionPolicy Unrestricted -File c:\UserLogonScript.ps1'
#$action.WorkingDirectory = '%ProgramFiles%\StationPlaylist\Studio'

$taskFolder = $ShedService.GetFolder("\")
# https://msdn.microsoft.com/en-us/library/windows/desktop/aa382577(v=vs.85).aspx
$taskFolder.RegisterTaskDefinition($taskName,$Task,6, "System",$null, 3)
