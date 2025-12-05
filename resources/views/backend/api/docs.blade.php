@extends('backend.app')
@section('title', 'API Documentation')

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <h4 class="fw-bold mb-3">API Documentation</h4>
                        <iframe src="https://documenter.getpostman.com/view/39612169/2sB3HkrLp7" width="100%" height="800"
                            style="border: none;">
                        </iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
