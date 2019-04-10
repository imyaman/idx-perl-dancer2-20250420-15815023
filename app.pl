#!/usr/bin/env perl
 
use JSON qw(from_json);
use URI::Encode qw(uri_decode);
use Data::Dumper;
use Dancer2;

get '/' => sub {
   my $err;
   template 'index.tt', {
       'err' => $err,
   };
};
 
get '/hello/:name' => sub {
    return "Why, hello there " . params->{name};
};

get '/envs' => sub {
  my $self = shift;
  my ($key, $envstring);
  for $key (keys %ENV){
    $envstring .= "$key : $ENV{$key}<br>\n";
  }
  return $envstring;
};

post '/github' => sub {
  my $self = shift;
  my ($mybody, $mypayload, $mypayloadjson);
#  for $key (keys %ENV){
#    $envstring .= "$key : $ENV{$key}<br>\n";
#  }
#  return $envstring;

  $mybody = request -> body;
  $mypayload = $mybody;
  $mypayload =~ s/payload=//;
  $mypayload = uri_decode($mypayload); 
  $mypayloadjson = from_json($mypayload);

#  debug Dumper($mypayloadjson);
#  debug $mypayloadjson->{pusher};
  if($mypayloadjson->{pusher}){
    # do deploy
    mydeploy();
  }else{
    # do not deploy, check again
   
  }
  return '{"result":"OK"}';
};

sub mydeploy {
  debug "I'll do deploy";
}

dance;
