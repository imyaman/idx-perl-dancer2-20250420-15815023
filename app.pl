#!/usr/bin/env perl

use Dancer2;
use Data::Dumper;
use JSON qw(from_json);
use URI::Encode qw(uri_decode);

get '/' => sub {
    template 'index.tt';
};

get '/envs' => sub {
    my $env_string = "";
    for my $key (keys %ENV) {
        $env_string .= "$key : $ENV{$key}<br>\n";
    }
    return $env_string;
};

post '/github' => sub {
    my $request_body = request->body;
    my $payload = $request_body;

    $payload =~ s/payload=//;
    $payload = uri_decode($payload);
    my $payload_json = from_json($payload);

    if ($payload_json->{pusher}) {
        # Do deployment
        _deploy();
    }

    return '{"result":"OK"}';
};

sub _deploy {
    debug "Deploying...";
}

dance;
