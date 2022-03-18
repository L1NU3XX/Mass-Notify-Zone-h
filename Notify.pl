#!/usr/bin/perl -U

#usage : perl deface.pl hasil.txt
#Private tools by MR.L1NU3X Don't Share This To Others Without MR.L1NU3X's Permission
use HTTP::Request;
use LWP::UserAgent;
use IO::Select;
use HTTP::Response;
sub do_visit()
{ 
  $useragen=LWP::UserAgent->new;
  $useragent="Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)";
  $useragen->agent($useragent);
  $useragen->timeout(7);
  our $response=$useragen->get($url);
  our $content=$response->content;
}
$file=$ARGV[0];
open(SHELL, "<$file");
         my(@line) = <SHELL>; 
         @line = sort(@line); 
         my($http);
	 lc($http);
         foreach $http (@line)
           {
           chomp($http);
           $http =~ s/^\s+//;
           $http =~ s/\s+$//;
                
          if($http=~/http/)
          {
              our $url=$http;
              do_visit();
         if($content=~/Hacked/ || $content=~/hacked/)
              {
	      $hasil=lc($url);
#              print "$hasil \n"; 
system "echo $hasil >> Succes.txt";
## submit to ZONE-H ##

				$Dom=$hasil;
				$Def="MR.L1NU3X";
				if ($Dom =~ /http:\/\//)
				{
				$U="http://zone-h.org/notify/single";
				$lwp=LWP::UserAgent->new;
				$res=$lwp  -> post($U,[
				'defacer'     => $Def,
				'domain1'   => $Dom,
				'hackmode' => '15',
				'reason'       => '1',
				'submit'       => 'Send',
				]);
				if ($res->content =~ /color="red">(.*)<\/font><\/li>/) {
				print "$hasil submit $1\n";
				}
				else
				{
				print "$hasil Error\n";
				}
				}
				else
				{
				$new="http://" . "$Dom";
				$U="http://zone-h.org/notify/single";
				$lwp=LWP::UserAgent->new;
				$res=$lwp  -> post($U,[
				'defacer'     => $Def,
				'domain1'   => $new,
				'hackmode' => '15',
				'reason'       => '1',
				'submit'       => 'Send',
				]);
				if ($res->content =~ /color="red">(.*)<\/font><\/li>/) {
				print "$hasil submit $1\n";
				}
				else
				{
				print "$hasil Error\n";
				}
				}

## submit selesai ###
              }
#	      else{
#	      $hasil=lc($url);
#	      print "$hasil tdk ditemukan \n";   
#		}
          }
}
close(SHELL);