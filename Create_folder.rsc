#
# Folder creation script v1.0 by MGReniero 07/12/2023

{
:local sep "/"
:local filetmp "filetmp"
      :global infromconsole do={:put $1 ; :return}
      :global root    [$infromconsole "Root:"]
      :global NewFolderName [$infromconsole "New folder name:"]
      :put "The path to the new folder is: $root/$NewFolderName"
:local lclwebsrv "http://127.0.0.1:86/"
:delay 1s
:if ([:len [/file find name="$root/$NewFolderName"]] > 0)  do={
:put "Folder $NewFolderName already exists!"
} else={
/ip/service/set www port=86
/ip/service/enable www
:delay 1s
/tool fetch $lclwebsrv dst-path="$sep$root$sep$NewFolderName$sep$filetmp"
:delay 1s
/file remove "$root$sep$NewFolderName$sep$filetmp"
:put "The $NewFolderName has been created!"
/ip/service/disable www
}
}
