#
#  bacula::fd::snapshot_scripts
#
# create create_snapshot and delete_snapshot scripts

define bacula::fd::snapshot_scripts(
    $run_before    = undef,
    $run_after     = undef,
    $script_name   = $title,

    $mountpoint    = "/snapshots/${title}",
    $lvm_vg        = undef,
    $lv_master     = undef,
    $lv_snapshot   = "snapshot-${lv_master}",
    $snapshot_size = '16GB',

    $config_root   = $::bacula::params::config_root
)  {

   $script_dir = "${config_root}/snapshots"
   file{$script_dir:
      ensure => directory,
   }

   file{$mountpoint:
      ensure => directory,
   }

   file{"${script_dir}/create-${script_name}-snapshot.sh":
     ensure      => file,
     content     => template('bacula/snapshot-create.sh.erb'),
     mode        => 0755,
   }
   file{"${script_dir}/drop-${script_name}-snapshot.sh":
     ensure      => file,
     content     => template('bacula/snapshot-drop.sh.erb'),
     mode        => 0755,
   }
}
