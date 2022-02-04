########## Bash Commands ##########
  
  > cd /Users/subhasiskhatua/Library/Application Support/Postgres/var-14/pg_log
	> brew install pgbadger
  > pgbadger ./postgresql-2022-02-04_072805.csv -f csv -d tuning
	> /usr/bin/perl -MCPAN -e'install Text::CSV_XS'
		○ /Users/subhasiskhatua/perl5/lib/perl5/darwin-thread-multi-2level/perllocal.pod
	Can't locate Text/CSV_XS.pm in @INC (you may need to install the Text::CSV_XS module) (@INC contains: /Library/Perl/5.30/darwin-thread-multi-2level /Library/Perl/5.30 /Network/Library/Perl/5.30/darwin-thread-multi-2level /Network/Library/Perl/5.30 /Library/Perl/Updates/5.30.2 /System/Library/Perl/5.30/darwin-thread-multi-2level /System/Library/Perl/5.30 /System/Library/Perl/Extras/5.30/darwin-thread-multi-2level /System/Library/Perl/Extras/5.30) at /usr/local/bin/pgbadger line 3767, <DATA> line 122.
	> export PERL5LIB=$PERL5LIB:/Users/subhasiskhatua/perl5/lib/perl5/darwin-thread-multi-2level
	

########## SQLs ###############
