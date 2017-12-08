#!/usr/bin/perl
#Coded By : dr-iman ( Guardiran Security Team 'Guardiran.org' )
#Ip Get Information Tool
use URI::URL;
use LWP::UserAgent;
use Term::ANSIColor;
use IO::Socket::INET;
use HTTP::Request;
use HTTP::Request::Common qw(POST);
use HTTP::Request::Common qw(GET);


system(($^O eq 'MSWin32') ? 'cls' : 'clear');
$logo = "
.-.         .--.       .-. 
: :        : .--'     .' `.
: :.---.   : : _  .--.`. .'
: :: .; `  : :; :' '_.': : 
:_;: ._.'  `.__.'`.__.':_; 
   : :                     
   :_;                     
.-.       .--.                         .-.  _             
: :      : .-'                        .' `.:_;            
: :,-.,-.: `;.--. .--. ,-.,-.,-. .--. `. .'.-. .--. ,-.,-.
: :: ,. :: :' .; :: ..': ,. ,. :' .; ; : : : :' .; :: ,. :
:_;:_;:_;:_;`.__.':_;  :_;:_;:_;`.__,_;:_; :_;`.__.':_;:_;  Coded By : dr-iman (Guardiran.org)                                                                                                                
";

print "$logo";

print "\n 1-Details On Another IP 2-Your Own Ip Address : ";
$method =<STDIN>;
chomp($method);
if ($method eq "1" or $method eq "Details On Another IP")
{
print "\n Enter Ip Target : ";
$ip =<STDIN>;
chomp($ip);
print "\n Your Target ip Address Is : $ip";
$info = "https://ipinfo.io/$ip/json";
information();

sub information ($info){
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
$ua->timeout (10);


my $information = $ua->get("$info")->content;
$information =~ s/"//g;
$information =~ s/{//g;
$information =~ s/}//g;
print "\n Result : $information \n";
}
}

elsif ($method eq "2" or $method eq "Your Own Ip Address")
{
$info = "https://ipinfo.io/json";
information2();

sub information2 ($info){
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
$ua->timeout (10);


my $information = $ua->get("$info")->content;
$information =~ s/"//g;
$information =~ s/{//g;
$information =~ s/}//g;
print "\n Result : $information ";
}
}